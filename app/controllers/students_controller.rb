class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
  end

  def activate
    student = set_student
    if student.active
      student.active = false
      # student.save
    else
      student.active = true
      # student.save
    end
    student.save
    redirect_to "/students/#{student.id}"
  end

  private
    def set_student
      @student = Student.find_by_id(params[:id])
    end
end