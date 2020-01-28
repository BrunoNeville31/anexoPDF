class CobrancasController < ApplicationController
  before_action :set_cobranca, only: [:show, :edit, :update, :destroy]

  # GET /cobrancas
  # GET /cobrancas.json
  def index
    @cobrancas = Cobranca.all
  end

  def pdf
   
    name = params[:cobranca][:pdf].original_filename
    path = File.join("tmp/pdf", name)
    File.open(path, "wb") { |f| f.write(params[:cobranca][:pdf].read) }

    reader = PDF::Reader.new(path)
    reader.pages.each do |page|
 
      @local = path
      @valor = reader.pages.first.text.scan(/VALOR.*/).first  
      @valor1 = reader.pages.first.text.scan(/Valor.*/).first
      @code = reader.pages.first.text.scan(/Controle.*/).first
      @data = reader.pages.first.text.scan(/solicitada.*/).first
      @data = reader.pages.first.text.scan(/Pagamento:.*/).first
      @code1 = reader.pages.first.text.scan(/DOCUMENTO .*/).first 
      puts "#{@valor} <-Valor"
      puts "#{@code}<-Code"
      puts "#{path}<-Path" 
    end
  end
  # GET /cobrancas/1
  # GET /cobrancas/1.json
  def show
  end

  # GET /cobrancas/new
  def new
    @cobranca = Cobranca.new
  end

  # GET /cobrancas/1/edit
  def edit
  end

  # POST /cobrancas
  # POST /cobrancas.json
  def create
    @cobranca = Cobranca.new(cobranca_params)
    @cobranca.path = "file:///home/bruno/Área%20de%20Trabalho/anexo/#{params[:cobranca][:path]}"

    respond_to do |format|
      if @cobranca.save
        format.html { redirect_to cobrancas_path, notice: 'Cobranca was successfully created.' }
        format.json { render :show, status: :created, location: @cobranca }
      else
        format.html { render :new }
        format.json { render json: @cobranca.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cobrancas/1
  # PATCH/PUT /cobrancas/1.json
  def update
    respond_to do |format|
      if @cobranca.update(cobranca_params)
        format.html { redirect_to cobrancas_path, notice: 'Cobranca was successfully updated.' }
        format.json { render :show, status: :ok, location: @cobranca }
      else
        format.html { render :edit }
        format.json { render json: @cobranca.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cobrancas/1
  # DELETE /cobrancas/1.json
  def destroy
    @cobranca.destroy
    respond_to do |format|
      format.html { redirect_to cobrancas_path, notice: 'Cobranca was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cobranca
      @cobranca = Cobranca.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cobranca_params
      params.require(:cobranca).permit(:user_id, :path, :data, :value, :code_id)
    end
end
