class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end

  def show
  end

  def new
  end

  def create
  end
end
