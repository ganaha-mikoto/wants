class RequestsController < ApplicationController
  # 全リクエストの一覧を表示
  def index
    @requests = Request.all
  end

  # 新規リクエスト投稿フォームを表示
  def new
    @request = Request.new
  end

  # 新規リクエストを作成
  def create
    @request = Request.new(request_params)
    @request.user = current_user # ログインユーザーをリクエストのユーザーに設定

    if @request.save
      redirect_to requests_path, notice: 'リクエストが作成されました。'
    else
      render :new
    end
  end

  private

  # Strong Parametersで許可されたパラメータを定義
  def request_params
    params.require(:request).permit(:title, :description, :category_id, :max_price, :min_price, :image, :shipping_charge_id)
  end
end