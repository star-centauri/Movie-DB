<html>
<?php
    $api_key = "4b8d46893e017f54d53564c2ff0d5019";

    function getDateMovie($api_key, $language, $type_search, $count_page, $query, $region) {
        $json = file_get_contents("https://api.themoviedb.org/3/search/".$type_search."?api_key=".$api_key.
            "&language=".$language."&query=".$query."&page=".$count_page."&include_adult=false");

        return $json;
    }

    echo getDateMovie($api_key, "pt-br", "movie", "500", "a", "");
    echo getDateMovie($api_key, "pt-br", "person", "500", "e", "US");
    echo getDateMovie($api_key, "pt-br", "genre/movie/list", "", "", "");


// --- Para fazer conexão com o banco de filmes mais tarde --- //
//$servername = "https://api.themoviedb.org/3/search/";
//$username = "username";
//$password = "password";

// Create connection
//$conn = new mysqli($servername, $username, $password);

// Check connection
//if ($conn->connect_error) {
//    die("Connection failed: " . $conn->connect_error);
//}
//echo "Connected successfully";
?>

</html>