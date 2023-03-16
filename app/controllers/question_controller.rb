class QuestionController < ApplicationController
  def index
    @questions = Question.all
  end

  def download
    pdf = Prawn::Document.new
    pad = 25

    pdf.bounding_box([pad, pdf.bounds.height - pad], :width => pdf.bounds.width - (pad * 2), :height => pdf.bounds.height - (pad * 2)) do
      pdf.text "100+ Ruby on Rails questions", size: 30, style: :bold
      Question.all.each_with_index do |question, index|
        pdf.text "#{index+1}. #{question.title}", margin: 40
      end
    end
    

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
    
  end
end