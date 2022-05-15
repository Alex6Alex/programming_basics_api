class Admin::LessonUnitsController < ApplicationController
  before_action :set_lesson_unit, only: %i[show edit update destroy]
  before_action :set_lesson, only: %i[create]

  def create
    @lesson_unit = LessonUnit.new(lesson_params) do |lesson_unit|
      lesson_unit.order = LessonUnit.maximum(:order).to_i + 1
      lesson_unit.lesson = @lesson
    end

    respond_to do |format|
      if @lesson_unit.save
        format.html { redirect_to(admin_lesson_path(@lesson_unit.lesson), notice: 'Lesson unit was successfully created.') }
      else
        # TODO: make it works
        # format.html { render(:new, status: :unprocessable_entity) }
      end
    end
  end

  def update
    respond_to do |format|
      if @lesson_unit.update(lesson_params)
        format.html { redirect_to(admin_lesson_path(@lesson_unit.lesson), notice: 'Lesson unit was successfully updated.') }
      else
        # TODO: make it works
        # format.html { render(:edit, status: :unprocessable_entity) }
      end
    end
  end

  def destroy
    @lesson_unit.destroy

    respond_to do |format|
      format.html { redirect_to(admin_lesson_path(@lesson_unit.lesson), notice: 'Lesson unit was successfully destroyed.') }
    end
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

  def set_lesson_unit
    @lesson_unit = LessonUnit.find(params[:id])
  end

  def lesson_params
    params.require('lesson_unit').permit(:content_block, :order)
  end
end
