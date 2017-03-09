class ClassroomsController < ApplicationController
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
end
