class QuestionController < ApplicationController
  def index
    @questions = Question.all
  end

  def download
    pdf = Prawn::Document.new
    pdf.text "100+ Ruby on Rails Interview Questions", :size => 20, :align => :center, :text => :bold, :header => true
    # pdf.text "*********RubyOnRails**********", :align => :center
    pdf.stroke_horizontal_rule
    # pdf.data = [["Ruby on interview question"]]
    # pdf.data += [["Ruby on interview question"]] * 30
    pdf.font "Times-Roman"
    pdf.move_down 25
    # respond_to do |format|
    # format.pdf do
        # headers["Content-Disposition", "ror"] = "attachment; filename=\"charts-#{Time.now.to_i}.pdf\"", "ror-faq"
      
  
      Question.all.each_with_index do |question, index|
        pdf.text "#{index+1}. #{question.title}", top_margin: 60
    end




# data = [["This row should be repeated on every new page"]]
# data += [["..."]] * 30
# table(data, :header => true)
    # footer [margin_box.left, margin_box.bottom + 10] do
    #   pdf.stroke_horizontal_rule
    #   pdf.move_down 3
    #   pdf.text "And here's a sexy footer - #{page_count}", :size => 16
    # end

    send_data(pdf.render,
      filename: "ror-faq.pdf",
      type: 'application/pdf',
      disposition: 'inline')
  end

  # def preview
  #   pdf = Prawn::Document.new
  #   pdf.text 'This is Preview'
  #   pdf.text 'It shows in the preview route'
  #   pdf.start_new_page
  #   pdf.text 'This is a new page'

  #   10.times do |i|
  #     pdf.text "This is line #{i}"
  #   end

  #   send_data(pdf.render,
  #     filename: 'hello.pdf',
  #     type: 'application/pdf',
  #     disposition: 'inline')
  # end

  private

  def question_params
    params.require(:question).permit(:title, :keyword)
  end
end