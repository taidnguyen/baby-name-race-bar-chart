d3.csv('/data/IMDB-Movie-Data.csv').then(function(data) {
  console.log(data);

  //read in data
  data.forEach( d => {
    title = d.title,
    genre = d.genre,
    year = d.year,
    rating = +d.rating,
    revenue = +d.revenue,
    metascore = +d.metascore
  });

});
