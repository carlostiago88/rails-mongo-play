# encoding utf-8
class ReportsController < ApplicationController
  def index
    reports = Report.order('created_at DESC')
    render json: { data: reports }, status: :ok
  end

  def create
    report = Report.create(report_params)
    if report.save
      render json: { status: 'SUCCESS', data: report },
             status: :ok
    else
      render json: { status: 'ERROR', message: 'Report not saved' },
             status: :unprocessable_entity
    end
  end

  def show
    report = Report.find params[:id]
    render json: { status: 'SUCCESS', data: report },
           status: :ok
  end

  def update
    report = Report.find params[:id]
    if report.update_attributes(report_params)
      render json: { status: 'SUCCESS', data: report },
             status: :ok
    else
      render json: { status: 'ERROR', data: report.errors },
             status: :unprocessable_entity
    end
  end

  def destroy
    report = Report.find params[:id]
    report.destroy
    render json: { status: 'SUCCESS', data: report }, status: :ok
  end

  private

  def report_params
    params.permit(:hospital, :patient, :type, :description)
  end
end
