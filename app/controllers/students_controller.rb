class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      respond_with @student, location: -> { new_student_path }
    else
      render :new
    end
  end

  private
  def student_params
    params.require(:student).permit(:name, :register_number, :status)
  end
end
