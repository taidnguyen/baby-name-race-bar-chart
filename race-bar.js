d3.csv('/data/IMDB-Movie-Data.csv').then(function(data) {
  console.log('data =====>', data);

  //read in data
  data.forEach( d => {
    d.title = d.title,
    d.genre = d.genre,
    d.year = +d.year,
    d.rating = +d.rating,
    d.revenue = +d.revenue,
    d.metascore = +d.metascore
  });

  var titles = new Set(data.map(d => d.title))
  console.log('titles ====>', titles);

  var yearrevenues = d3.nest().key(d => d.year).rollup(([d]) => [+d.year, d.revenue, d.title]).entries(data);
    // .map(([year, data]) => [year, data])
    // .sort(([a], [b]) => d3.ascending(a, b));
  console.log('yearrevenues =====>', yearrevenues);

  function rank(revenue) {
    const data = Array.from(titles, title => ({title, value: revenue(title)}));
    data.sort((a, b) => d3.descending(a.value, b.value));
    for (let i = 0; i < data.length; ++i) data[i].rank = Math.min(n, i);
    return data;
  }

  // rank(name => yearrevenues[0][1].get(title))
});
