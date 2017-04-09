class CategoriesController < ApplicationController
    def category_params
        params.require(:category).permit(:name, :description, :positive)
    end
    
    def index
        @categories = current_user.categories
    end
    
    def show
        @category = Category.find params[:id]
    end
    
    def create
        @category = Category.create!(category_params)
        @category.user_id = current_user.id
        @category.save
        flash[:notice] = "Category created"
        redirect_to categories_path
    end
    
    def new
        
    end
    
    def edit
        @category = Category.find params[:id]
    end
    
    def update
        @category = Category.find params[:id]
        @category.update_attributes! category_params
        flash[:notice] = "Category updated"
        redirect_to category_path(@category) 
    end
    
    def destroy
        @category = Category.find params[:id]
        @category.destroy
        flash[:notice] = "Category deleted"
        redirect_to categories_path
  end
end
