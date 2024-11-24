class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Post was successfully created."
      redirect_to book_path(@book.id)
    else
      flash.now[:notice] = "投稿に失敗しました。"
      @books = Book.all # エラー時に一覧ページを再表示
      render :index
    end
  end


  def show
    @book = Book.find(params[:id]) 
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Updated successfully."
      redirect_to book_path(@book.id)
    else
      flash.now[:alert] = '更新失敗'
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: '削除完了'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end



end
