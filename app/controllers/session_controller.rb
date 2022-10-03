class SessionController < ApplicationController
    def index 
        session[:page_views] ||= 0
        
        if session[:page_views] <= 3
            session[:page_views] += 1
            article = Article.find(params[:id])
            render json: article
        else 
            session[:page_views] += 1
            render json: { error: "unauthorized."}, status: :unauthorized
        end
        
    end
end
