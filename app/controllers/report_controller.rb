# encoding utf-8
class ReportController < ApplicationController
  def index
    reports = Report.order('created_at DESC')
    render json: {status: 'SUCCESS', message:'Report loaded', data: reports}, status: :ok
  end

  def create
    report = Report.create(report_params)
    if report.save
      render json: {status: 'SUCCESS', message: 'Report loaded', data: report}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Report not saved'}, status: :fail
    end
  end



  private

  def report_params
    params.permit(:hospital, :patient, :type, :description)
  end
end
