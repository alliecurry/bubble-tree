class BubblesController < ApplicationController
  before_action :set_bubble, only: [:show, :edit, :update, :destroy]
  before_action :set_instance_variables
  before_action :set_bubbles, only: [:index, :new, :edit]

  # GET /bubbles
  # GET /bubbles.json
  def index
  end

  # GET /bubbles/1
  # GET /bubbles/1.json
  def show
  end

  # GET /bubbles/new
  def new
    @bubble = Bubble.new
  end

  # GET /bubbles/1/edit
  def edit
  end

  # POST /bubbles
  # POST /bubbles.json
  def create
    binding.pry
    @bubble = Bubble.new(bubble_params)

    respond_to do |format|
      if @bubble.save
        format.html { redirect_to [@project, @tree, @bubble], notice: 'Bubble was successfully created.' }
        format.json { render :show, status: :created, location: @bubble }
      else
        format.html { render :new }
        format.json { render json: @bubble.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bubbles/1
  # PATCH/PUT /bubbles/1.json
  def update
    respond_to do |format|
      if @bubble.update(bubble_params)
        format.html { redirect_to [@project, @tree, @bubble], notice: 'Bubble was successfully updated.' }
        format.json { render :show, status: :ok, location: @bubble }
      else
        format.html { render :edit }
        format.json { render json: @bubble.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bubbles/1
  # DELETE /bubbles/1.json
  def destroy
    @bubble.destroy
    respond_to do |format|
      format.html { redirect_to project_tree_bubbles_url(@project, @tree), notice: 'Bubble was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bubble
      @bubble = Bubble.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bubble_params
      params.require(:bubble).permit(:name, :description, :tree_id, :parent_id)
      .merge(params.permit(:tree_id))
      # # This should probably be cleaned
      # .merge({parent_id: params.require(:parent)})
    end

    def set_instance_variables
      @project = Project.find(params[:project_id])
      @tree = Tree.find(params[:tree_id])
    end

    def set_bubbles
      @bubbles = Bubble.where(tree: @tree)
    end
end
