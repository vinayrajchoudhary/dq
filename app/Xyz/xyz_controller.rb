require 'rho/rhocontroller'
require 'helpers/browser_helper'

class XyzController < Rho::RhoController
  include BrowserHelper

  # GET /Xyz
  def index
   @articles = Article.find(:all)
    render 
  end
  def list
    @articles = Article.find(:all)
     @query = @params['search']  
    if @params['searchd']
       
     result = Rho::AsyncHttp.get(
          :url => "http://daqwest.com/rhodes.json?a="+@params['search']
        )
        @get_result = result["body"]
          @d = Rho::JSON.parse(@get_result)   
    end  
      
     render 
  end
  # GET /Xyz/{1}
  def show
    if @params['ad']
    
    result = Rho::AsyncHttp.get(
            :url => "http://daqwest.com/rhodesread.json?ad="+@params['ad']
          )
    @get_result = result["body"] 
      source = @params['ad']
      @source = "wiki"
            if source.include?("http")
              @source = source.split("/")[2]
            else
              @source = source.split("/")[1]
            end
      @d = Rho::JSON.parse(@get_result)  
    end
    if @get_result
    
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Xyz/new
  def new
    @xyz = Xyz.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Xyz/{1}/edit
  def edit
    @xyz = Xyz.find(@params['id'])
    if @xyz
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Xyz/create
  def create
    @xyz = Xyz.create(@params['xyz'])
    redirect :action => :index
  end

  # POST /Xyz/{1}/update
  def update
    @xyz = Xyz.find(@params['id'])
    @xyz.update_attributes(@params['xyz']) if @xyz
    redirect :action => :index
  end

  # POST /Xyz/{1}/delete
  def delete
    @xyz = Xyz.find(@params['id'])
    @xyz.destroy if @xyz
    redirect :action => :index  
  end
  def httpget_callback
    if @params["status"] != "ok"
      @@error_params = @params
      @s = "vinay"
    else
      @@get_result = @params["body"]
      @s = "aashima"
    end
  end
end
