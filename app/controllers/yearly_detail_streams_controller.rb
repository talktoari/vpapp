class YearlyDetailStreamsController < ApplicationController
  # GET /yearly_detail_streams
  # GET /yearly_detail_streams.json
  def index
    @yearly_detail_streams = YearlyDetailStream.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @yearly_detail_streams }
    end
  end

  # GET /yearly_detail_streams/1
  # GET /yearly_detail_streams/1.json
  def show
    @yearly_detail_stream = YearlyDetailStream.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @yearly_detail_stream }
    end
  end

  # GET /yearly_detail_streams/new
  # GET /yearly_detail_streams/new.json
  def new
    @yearly_detail_stream = YearlyDetailStream.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @yearly_detail_stream }
    end
  end

  # GET /yearly_detail_streams/1/edit
  def edit
    @yearly_detail_stream = YearlyDetailStream.find(params[:id])
  end

  # POST /yearly_detail_streams
  # POST /yearly_detail_streams.json
  def create
    @yearly_detail_stream = YearlyDetailStream.new(params[:yearly_detail_stream])

    respond_to do |format|
      if @yearly_detail_stream.save
        format.html { redirect_to @yearly_detail_stream, notice: 'Yearly detail stream was successfully created.' }
        format.json { render json: @yearly_detail_stream, status: :created, location: @yearly_detail_stream }
      else
        format.html { render action: "new" }
        format.json { render json: @yearly_detail_stream.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /yearly_detail_streams/1
  # PUT /yearly_detail_streams/1.json
  def update
    @yearly_detail_stream = YearlyDetailStream.find(params[:id])

    respond_to do |format|
      if @yearly_detail_stream.update_attributes(params[:yearly_detail_stream])
        format.html { redirect_to @yearly_detail_stream, notice: 'Yearly detail stream was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @yearly_detail_stream.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yearly_detail_streams/1
  # DELETE /yearly_detail_streams/1.json
  def destroy
    @yearly_detail_stream = YearlyDetailStream.find(params[:id])
    @yearly_detail_stream.destroy

    respond_to do |format|
      format.html { redirect_to yearly_detail_streams_url }
      format.json { head :ok }
    end
  end
end
