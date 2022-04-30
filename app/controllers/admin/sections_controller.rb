class Admin::SectionsController < ApplicationController
  before_action :set_section, only: %i[show edit update destroy]

  def index
    @sections = Section.all
  end

  def show; end

  def new
    @section = Section.new
  end

  def edit; end

  def create
    @section = Section.new(section_params)

    respond_to do |format|
      if @section.save
        format.html { redirect_to(admin_section_path(@section), notice: 'Section was successfully created.') }
      else
        format.html { render(:new, status: :unprocessable_entity) }
      end
    end
  end

  def update
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to(admin_section_path(@section), notice: 'Section was successfully updated.') }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
      end
    end
  end

  def destroy
    @section.destroy

    respond_to do |format|
      format.html { redirect_to(admin_sections_path, notice: 'Section was successfully destroyed.') }
    end
  end

  private

  def set_section
    @section = Section.find(params[:id])
  end

  def section_params
    params.require('section').permit(:name, :description, :order)
  end
end
