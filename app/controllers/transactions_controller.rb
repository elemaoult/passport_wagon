class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
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
