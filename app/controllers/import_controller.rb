class ImportController < ApplicationController
    
    def index
        @users = User.all
    end

    def load
        User.loadCSV(params[:file])
        redirect_to root_path
    end
end
