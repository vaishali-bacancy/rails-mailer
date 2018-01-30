class ArticleNotificationMailer < ApplicationMailer

	def article_create_notification(user, article)
		@user = user
		@article = article
		puts @user.email
		mail to: [ @user.email], subject: "Article created successfully"
	end
end
