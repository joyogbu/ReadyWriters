<%- include ('includes/header.ejs'); %>
		<div class="main_div">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-8 post_details">
						<div class="post_details_box">
				 			<% postdata.forEach(function(data, index) { %>
							<h2><%= data.post_title %></h2><br>
							<p><span class="author_image"><img src="/images/authors/<% data.author_image %>"></span><span><%= data.author_firstname + data.author_lastname %></span><span class="last_update">Last updated on <%= data.date_updated.toLocaleDateString() %></span></p><br>
							<div class="post_details_image">
								<img src="/images/<%= data.post_image %>" class="image_post_details">
							</div><br><br>
							<div class ="post_details_text">
								<p><%= data.post_text %></p>
							
					   		</div>
							<br><br><div id="about_author"><h3>About the author</h3><div id="about_author_image"><img class="author_thumbnail" src="/images/authors/<%= data.author_image%> "></div><div id="about_author_info"><p><%= data.author_firstname + data.author_lastname %></p><p><%= data.author_bio %></p></div></div><br><br>
							<% }); %>
						</div>
						<p>author id is <%= auth_id %></p>
						<div class="container-fluid same_author_posts">
						<h3>Posts By The Same Author</h3>
						<div class="row same_author_box"></div><br>
						</div><br><br>
						<div class="comment_div">
							<h3>Leave a Comment</h3>
							<span class="no_comments">0 Comment(s)</span>
							<form>
								<label>Name</label><br><input type="text"></input><br><br>
								<label>Email (Required but never shown)</label><br><input type="text"></input><br><br>
								<label>Comment</label><br><textarea></textarea><br><br>
								<button type="button">Send</button><br>
							</form>
						</div><br><br>
					</div>
					<div class="col-sm-3">
						<%- include ('includes/section.ejs'); %>
					</div>
				</div>
			</div>
		</div><br><br>
		<footer>
			<%- include (
'includes/footer.ejs'); %>
		</footer>
		<script>
			$(document).ready(function() {
			//		$("#same_btn").click(function() {
				$.ajax({
					url: '/fetch_posts/1',
					data: <%= auth_id %>,
					type: "GET",
					success: function(response) {
						response.forEach(function (item) {
							const imgTag = $('<img>', {
								src: '/images/' + item.post_image,
								class: 'other_post_image'
							});
							const divTag = $('<div', {
								class: 'sdame_author_bo',
							});
							const imgUrl = '/images/'+item.post_image;
							const imageTag = `<img src="${imgUrl}" class="other_post_images">`
							$('.same_author_box').append('<div class ="col-sm-6 same_author_bo">' + imageTag + '<h3>' + item.post_title + '</h3><p>' + item.post_intro + '</p><a href="#">Read More</a></div>');
						});
						//}
					},
					error: function(error) {
							console.error('Error:', error);
					}
				});
			});
		</script>
	</body>
</html>
