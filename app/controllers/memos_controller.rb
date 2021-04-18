class MemosController < ApplicationController
  before_action :set_memo, only: %I[show edit update destroy]
  
  def index
    @memos = Memo.where(user: current_user).order(updated_at: :desc)
  end
  
  def show; end
  
  def new
    @memo = Memo.new
  end

  def edit; end

  def create
    Memo.create!(memo_params)
    redirect_to memos_path
  end

  def update
    @memo.update!(memo_params)
    redirect_to memos_path
  end

  def destroy
    @memo.destroy!
    redirect_to memos_path
  end

  private

  def set_memo
    @memo = Memo.find(params[:id])
  end

  def memo_params
    params.require(:memo).permit(:title, :content).merge(user: current_user)
  end
end
