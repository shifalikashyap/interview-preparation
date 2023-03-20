class QuestionController < ApplicationController
  def index
    @questions = Question.all
  end

  def download
    question_pdf = Prawn::Document.new
    question_pdf.repeat (:all)  do
      question_pdf.bounding_box([question_pdf.bounds.left, question_pdf.bounds.top], width: question_pdf.bounds.width) do 
        question_pdf.text "Ruby on Rails Interview Questions- Appsimpact Academy", :size => 21, :align => :center, :color => "0000ff", font: "Times-Roman"
        question_pdf.stroke_horizontal_rule
      end
      question_pdf.move_down 30
    end

    question_pdf.bounding_box([question_pdf.bounds.left, question_pdf.cursor], width: question_pdf.bounds.width, height: question_pdf.cursor) do

      question_pdf.font('Helvetica') do
        Question.all.each_with_index do |question, index|
          question_pdf.text "#{index+1}. #{question.title}"
          question_pdf.move_down 5
        end
      end
      send_data(question_pdf.render,
        filename: "ror-faq.pdf",
        type: 'application/pdf',
        disposition: 'inline')
    end
  end


# post_pdf = Prawn::Document.new
#     post_pdf.repeat(:all) do
#       post_pdf.bounding_box([post_pdf.bounds.left, post_pdf.bounds.top], width: post_pdf.bounds.width) do
#         post_pdf.text 'Blogging App', size: 35, style: :bold, align: :center, font: 'Helvetica'
#         post_pdf.stroke_horizontal_rule
#       end
#       post_pdf.move_down 30
#     end

#     post_pdf.bounding_box([post_pdf.bounds.left, post_pdf.cursor], width: post_pdf.bounds.width, height: post_pdf.cursor) do
#       post_pdf.font('Helvetica') do
#         post_pdf.text @post.title, size: 30, style: :bold, align: :center
#       end
#       post_pdf.text @post.description
#     end 
#     send_data(post_pdf.render, filename: "#{@post.title}.pdf", type: 'application/pdf', disposition: 'inline')



# data = [["This row should be repeated on every new page"]]
# data += [["..."]] * 30
# table(data, :header => true)
    # footer [margin_box.left, margin_box.bottom + 10] do
    #   pdf.stroke_horizontal_rule
    #   pdf.move_down 3
    #   pdf.text "And here's a sexy footer - #{page_count}", :size => 16
    # end

  #   send_data(pdf.render,
  #     filename: "ror-faq.pdf",
  #     type: 'application/pdf',
  #     disposition: 'inline')
  # end

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