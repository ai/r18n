# encoding: utf-8
require File.expand_path('../spec_helper', __FILE__)

describe TestController, :type => :controller do
  integrate_views
  
  it 'should use default locale' do
    get :locales
    response.should be_success
    response.body.should == 'ru'
  end 
  
  it 'should get locale from param' do
    get :locales, :locale => 'ru'
    response.should be_success
    response.body.should == 'ru, en'
  end
  
  it 'should get locale from session' do
    get :locales, {}, { :locale => 'ru' }
    response.should be_success
    response.body.should == 'ru, en'
  end
  
  it 'should get locales from http' do
    request.env['HTTP_ACCEPT_LANGUAGE'] = 'ru,fr;q=0.9'
    get :locales
    response.should be_success
    response.body.should == 'ru, fr, en'
  end
  
  it 'should load translations' do
    get :translations, :locale => 'en'
    response.should be_success
    response.body.should == 'R18n: supported. Rails I18n: supported'
  end
  
  it 'should return available translations' do
    get :available
    response.should be_success
    response.body.should == 'en ru'
  end
  
  it 'should add helpers' do
    get :helpers, :locale => 'en'
    response.should be_success
    response.body.should == "Name\nName\nName\nName\n"
  end
  
  it 'should format untranslated' do
    get :untranslated
    response.should be_success
    response.body.should == 'user.<span style="color: red">not.exists</span>'
  end
  
  it "should add methods to controller" do
    get :controller, :locale => 'en'
    response.should be_success
    response.body.should == "NameNameName"
  end
  
  it "should localize time by Rails I18n" do
    get :time, :locale => 'en'
    response.should be_success
    response.body.should == "Thu, 01 Jan 1970 00:00:00 +0000\n01 Jan 00:00"
  end
  
  it "should localize time by R18n" do
    get :human_time, :locale => 'en'
    response.should be_success
    response.body.should == "now"
  end
  
  it "should translate models" do
    ActiveRecord::Schema.verbose = false
    ActiveRecord::Schema.define(:version => 20091218130034) do
      create_table "posts", :force => true do |t|
        t.string "title_en"
        t.string "title_ru"
      end
    end
    
    Post.unlocalized_getters(:title).should == { 'ru' => 'title_ru',
                                                 'en' => 'title_en' }
    Post.unlocalized_setters(:title).should == { 'ru' => 'title_ru=',
                                                 'en' => 'title_en=' }
    
    @post = Post.new
    @post.title_en = 'Record'
    
    R18n.set(R18n::I18n.new('ru'))
    @post.title.should == 'Record'
    
    @post.title = 'Запись'
    @post.title_ru.should == 'Запись'
    @post.title_en.should == 'Record'
    @post.title.should == 'Запись'
  end
  
end
