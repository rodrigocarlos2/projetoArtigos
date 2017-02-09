class FoldersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_folder, only: [:show, :edit, :update, :destroy]

  # GET /folders
  # GET /folders.json
  def index
    #Cria uma pesquisa com ransack, caso não tenha nenhuma pesquisa ele retorna
    #todos os registros
    @q = Folder.ransack(params[:q])
    @folders = @q.result
    #Pega as pastas que pertencem ao usuario logado
    @folders = @folders.where(user_id: current_user.id)
    #Utilização do will_paginate
    @folders = @folders.paginate(:page => params[:page], :per_page => 20)
  end

  # GET /folders/1
  # GET /folders/1.json
  def show
    #Cria uma pesquisa com ransack, caso não tenha nenhuma pesquisa ele retorna
    #todos os artigos da pasta
    @q = Example.ransack(params[:q])
    @examples = @q.result
    #Filtra os artigos pela pasta
    @examples = @examples.where(folder_id: params[:id])
    #Utilização do will_paginate
    @examples = @examples.paginate(:page => params[:page], :per_page => 20)

    @folder_users = FolderUser.new
  end

  # GET /folders/new
  def new
    @folder = Folder.new
  end

  # GET /folders/1/edit
  def edit
  end

  # POST /folders
  # POST /folders.json
  def create
    @folder = Folder.new(folder_params)
    #Adiciona na pasta o usuarios dono
    @folder.user_id = current_user.id;

    respond_to do |format|
      if @folder.save
        format.html { redirect_to @folder, notice: 'Operação realizada com sucesso.' }
        format.json { render :show, status: :created, location: @folder }
      else
        format.html { render :new }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /folders/1
  # PATCH/PUT /folders/1.json
  def update
    respond_to do |format|
      if @folder.update(folder_params)
        format.html { redirect_to @folder, notice: 'Operação realizada com sucesso.' }
        format.json { render :show, status: :ok, location: @folder }
      else
        format.html { render :edit }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /folders/1
  # DELETE /folders/1.json
  def destroy
    @folder.destroy
    respond_to do |format|
      format.html { redirect_to folders_url, notice: 'Operação realizada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_folder
      @folder = Folder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def folder_params
      params.require(:folder).permit(:name, :user_id)
    end
end
