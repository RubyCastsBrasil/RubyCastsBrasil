class Dashboard::CastsController < Dashboard::ApplicationController
  before_action :cast, only: [:edit, :update, :destroy]

  def new
    @cast = Cast.new
  end

  def create
    @cast = current_user.casts.build(cast_params)
    if @cast.save
      redirect_to @cast
    else
      render :new
    end
  end

  def update
    if @cast.update(cast_params)
      redirect_to @cast
    else
      render :edit
    end
  end

  def destroy
    if @cast.destroy
      # flash...
    else
      # flash...
    end
    redirect_to dashboard_root_path
  end

  private
    def cast
      @cast = Cast.find(params[:id])
    end

    def cast_params
      params.require(:cast).permit(:name, :description, :url)
    end
end