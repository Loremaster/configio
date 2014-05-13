class AppConfigsController < ApplicationController
  before_action :set_types, except: [:index, :destroy]
  before_action :find_app_config, only: [:edit, :update, :destroy]

  def index
    @app_configs = AppConfig.cached_all
  end

  def new
    @app_config = AppConfig.new
  end

  def create
    @app_config = AppConfig.new(app_config_params)

    if @app_config.save
      flash[:success] = "Configuration created!"
      redirect_to app_configs_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @app_config.update_attributes( app_config_params )
      flash[:success] = "Configuration updated!"
      redirect_to app_configs_path
    else
      render :edit
    end
  end

  def destroy
    if @app_config.destroy
      flash[:notice] = "Configuration deleted."
    end

    redirect_to app_configs_path
  end

  private

  def app_config_params
    params.require(:app_config).permit(:value, :value_type)
  end

  def set_types
    @types = AppConfig::AVAILABLE_TYPES
  end

  def find_app_config
    @app_config = AppConfig.find_by(id: params[:id])
  end
end
