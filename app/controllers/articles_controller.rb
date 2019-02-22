class ArticlesController < ApplicationController

	def index	
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end
	
	def new
		@article = Article.new
	end

	def create
		# render plain: params[:article].inspect
		@article = Article.new(article_params)
		# @article.save
		if @article.save 
			flash[:notice] = "Article was sucessfully created"
			redirect_to article_path(@article)
		else
			render 'new'
		end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update 
		@article = Article.find(params[:id])
		if @article.update(article_params)
			flash[:notice] = "Article was sucessfully updated"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end	

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash[:notice] = "Artice was successfully deleted"
		redirect_to articles_path
	end

	private
		def article_params
			params.require(:article).permit(:title, :deiscription)
		end
end
