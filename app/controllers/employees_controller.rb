class EmployeesController < ApplicationController


    def index 
        @employees = Employee.all 
    end 

    def show 
        @employee = Employee.find_by(id: params[:id])
    end 

    def new 
        @employee = Employee.new 
        @dogs = Dog.all 
    end 

    def create 
        @employee = Employee.create(strong_params)

        if @employee.valid? 
            redirect_to employee_path(@employee)
        else 
            flash[:errors] = @employee.errors.full_messages 
            redirect_to new_employee_path
        end 
    end 

    def edit 
        @employee = Employee.find_by(id: params[:id])
        @dogs = Dog.all 
    end 

    def update 
        @employee = Employee.find_by(id: params[:id])
        @employee.update(strong_params)
        redirect_to employee_path(@employee) 
    end 

    def destroy 
        @employee.destroy 
        redirect_to employees_path
    end 

    private 

    def strong_params 
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id, :img_url)
    end 
   
end
