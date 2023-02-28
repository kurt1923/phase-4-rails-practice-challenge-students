class StudentsController < ApplicationController
    
    
    def index
        students = Student.all
        render json: students
    end
    
    def show
        student = find_student
        render json: student
    end
    
    
    def create
        student = Student.create(student_params)
        render json: student
    end

    def update
        student = find_student
        student.update(student_params)
        render json: student
    end

    def destroy
        student = find_student
        student.destroy
        render json: student
    end

    private

    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end

    def find_student
        Student.find(params[:id])
    end

    def render_not_found_response
        render json: { error: "Student not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end