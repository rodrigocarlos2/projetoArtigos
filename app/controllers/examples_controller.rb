class ExamplesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_example, only: [:show, :edit, :update, :destroy]
  
  # GET /examples
  # GET /examples.json
  def index
    
    @q = Example.ransack(params[:q])

    @examples_public = @q.result.where(private: false)
    @examples_public = @examples_public.paginate(:page => params[:page], :per_page => 20)

    user_id = current_user.id

    @q = Example.ransack(params[:q])
    @example_privates = @q.result.where(private: true)
    @example_privates = @example_privates.paginate(:page => params[:page], :per_page => 20)
    
  end

  # GET /examples/1
  # GET /examples/1.json
  def show
  end

  # GET /examples/new
  def new
    @example = Example.new
    #verifica se existe um parametro para ser passado no folder_id
    if !params[:id].nil?
    @example.folder_id = params[:id]
    end
  end

  # GET /examples/1/edit
  def edit
  end

  # POST /examples
  # POST /examples.json
  def create
    @example = Example.new(example_params)
    @example.my_file = params[:file]

    respond_to do |format|
      #Verifica se existe pasta criada
      if @example.folder_id.nil?
        format.html { redirect_to root_url, alert: 'Cadastre uma pasta antes de inserir um arquivo.' }
      else
        if @example.save
          format.html { redirect_to @example, notice: 'Operação realizada com sucesso.' }
          format.json { render :show, status: :created, location: @example }
        else
          format.html { render :new }
          format.json { render json: @example.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /examples/1
  # PATCH/PUT /examples/1.json
  def update
    respond_to do |format|
      if @example.update(example_params)
        format.html { redirect_to @example, notice: 'Operação realizada com sucesso.' }
        format.json { render :show, status: :ok, location: @example }
      else
        format.html { render :edit }
        format.json { render json: @example.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /examples/1
  # DELETE /examples/1.json
  def destroy
    @example.destroy
    respond_to do |format|
      format.html { redirect_to examples_url, notice: 'Operação realizada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_example
      @example = Example.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def example_params
      params.require(:example).permit(:name, :my_file, :folder_id, :private)
    end
end
