class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to book_path(@book.id)
    else
      flash[:notice] = "投稿に失敗しました。"
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
      redirect_to books_path(@book), notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: 'Book was successfully destroyed.'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end



end
