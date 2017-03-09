class ClassroomsController < ApplicationController
  before_filter :check_if_has_course,
                :check_if_has_student

  def new
    @classroom = Classroom.new
  end

  def create
    @classroom = Classroom.new(classroom_params)
    if @classroom.save
      respond_with @classroom, location: -> { new_classroom_path }
    end
  end

  private
  def classroom_params
    params.require(:classroom).permit(:student_id, :course_id)
  end

  def check_if_has_course
    if Course.all.blank?
      redirect_to :new_course
    end
  end

  def check_if_has_student
    if Student.all.blank?
      redirect_to :new_student
    end
  end
end
