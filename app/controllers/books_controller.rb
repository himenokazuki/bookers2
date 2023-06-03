class BooksController < ApplicationController
  def new
     @book = Book.new
  end

  def index
    @books = Book.all
    @user=current_user
    @book=Book.new
  end

  def show
    @book=Book.find(params[:id])
  end

  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    @book.user_id=current_user.id
    # 3. データをデータベースに保存するためのsaveメソッド実行
    @book.save
    # 4. トップ画面へリダイレクト
    redirect_to book_path(@book.id)
  end

  def  edit
    @book=Book.find(params[:id])
  end

    # ストロングパラメータ

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(book.id)
  end

  private
   def book_params
    params.require(:book).permit(:title, :body)
   end
end