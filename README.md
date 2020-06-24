Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

```
<!-- REPORT CARD -->
  <div class="report-card">
    <img src="https://www.mybins.com.au/uploads/2/5/6/8/25680378/published/broken-wheeli-bin.jpg?1518481761">
    <div class="ml-3 report-card-info">
      <div class="report-text">
        <div>
          <h2>Card bin crashed</h2>
          <p><i class="fas fa-map-marker-alt mr-2"></i>Barcelona</p>
        </div>
        <div>
          <a href="#" class="badge badge-pill border badge-light">Category</a>
        </div>
      </div>
      <div class="upvotes-buttons mr-3">
        <a href="#"><i class="fas fa-chevron-up upvote-arrow"></i></a>

        <span class="line-height">413</span>
        <a href="#"><i class="fas fa-chevron-down downvote-arrow"></i></a>
      </div>
    </div>
  </div>



<!-- CAROUSEL -->
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <div class="home-card">
        <%= image_tag("speaker.png") %>
        <div>
          <h5>Report a problem</h5>
        </div>
      </div>
    </div>
    <div class="carousel-item">
      <div class="home-card">
        <%= image_tag("good.png") %>
        <div>
          <h5>Upvote & priotitize reports</h5>
        </div>
      </div>
    </div>
    <div class="carousel-item">
       <div class="home-card">
        <%= image_tag("share.png") %>
        <div>
          <h5>Share issues with your community</h5>
        </div>
      </div>
    </div>
  </div>

  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" ></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

```
