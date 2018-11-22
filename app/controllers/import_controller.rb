class ImportController < ApplicationController
    
    def index
        @users = User.all
    end

    def load
        @errors = User.loadCSV(params[:file])
        redirect_to root_path, :notice => @errors
    end
end
