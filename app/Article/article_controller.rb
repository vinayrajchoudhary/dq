require 'rho/rhocontroller'
require 'helpers/browser_helper'

class ArticleController < Rho::RhoController
  include BrowserHelper

  # GET /Article
  def index
    @articles = Article.find(:all)
    render :back => '/app'
  end

  # GET /Article/{1}
  def show
    @article = Article.find(@params['id'])
    if @article
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Article/new
  def new
    @article = Article.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Article/{1}/edit
  def edit
    @article = Article.find(@params['id'])
    if @article
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Article/create
  def create
    @article = Article.create(@params['article'])
    redirect :action => :index
  end

  # POST /Article/{1}/update
  def update
    @article = Article.find(@params['id'])
    @article.update_attributes(@params['article']) if @article
    redirect :action => :index
  end

  # POST /Article/{1}/delete
  def delete
    @article = Article.find(@params['id'])
    @article.destroy if @article
    redirect :action => :index  
  end
end
