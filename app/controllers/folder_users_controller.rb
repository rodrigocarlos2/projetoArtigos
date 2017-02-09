class FolderUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_folder_user, only: [:show, :edit, :update, :destroy]

  # GET /folder_users
  # GET /folder_users.json
  def index
      #Pega todos os usuarios da pasta
      @folder_users = FolderUser.where(folder_id: params[:id])
      #Pega o nome da pasta
      @folder = Folder.where(id: params[:id]).first

  end

  # GET /folder_users/1
  # GET /folder_users/1.json
  def show
  end

  # GET /folder_users/new
  def new
    #Pega a pasta que deve ser inserida no compartilhamento
    @folder_id = params[:id]
  end

  # GET /folder_users/1/edit
  def edit
  end

  # POST /folder_users
  # POST /folder_users.json
  def create
    
      @folder_user = FolderUser.new
      @user = User.where(email: params[:user][:email])
      
      @folder_user.folder_id = params[:folder_id]

    respond_to do |format|
      if @folder_user.user_id==current_user.id
        format.html { redirect_to folders_url, alert: 'Você digitou seu proprio E-mail.' }
      else
        if @user.empty?
          format.html { redirect_to folders_url, alert: 'Email não existe.' }
        else
          @folder_user.user_id = @user.first.id
          if @folder_user.save
            format.html { redirect_to folders_url, notice: 'Operação realizada com sucesso.' }
            format.json { render :show, status: :created, location: @folder_user }
          else
            format.html { render :new }
            format.json { render json: folders_url, status: :unprocessable_entity }
          end
        end
      end
    end
  end

  # PATCH/PUT /folder_users/1
  # PATCH/PUT /folder_users/1.json
  def update
    respond_to do |format|
      if @folder_user.update(folder_user_params)
        format.html { redirect_to folders_url, notice: 'Operação realizada com sucesso.' }
        format.json { render :show, status: :ok, location: @folder_user }
      else
        format.html { render :edit }
        format.json { render json: folders_url, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /folder_users/1
  # DELETE /folder_users/1.json
  def destroy
    @folder_user.destroy
    respond_to do |format|
      format.html { redirect_to folders_url, notice: 'Operação realizada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_folder_user
      @folder_user = FolderUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def folder_user_params
      params.require(:folder_user).permit(:folder_id, :user_id)
    end
end
