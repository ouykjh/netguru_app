class PaymentsController < ApplicationController
  expose(:payments) { Payment.includes(:student) }
end