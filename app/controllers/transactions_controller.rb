class TransactionsController < ApplicationController
  def index
    @transactions = policy_scope(Transaction).order(created_at: :desc)
  end

  def show
  end

  def new
    @transaction = Transaction.new
    authorize @transaction
  end

  def create
  end
end
