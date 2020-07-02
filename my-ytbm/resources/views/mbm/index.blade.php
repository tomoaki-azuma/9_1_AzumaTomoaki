
<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>My-MBM:{{ $bookmark->title }}</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <!-- Global site tag (gtag.js) - Google Analytics -->
        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-169185052-1"></script>
        
        <style>
            html {
                font-size: 14px; /* ルート要素のフォントサイズを1rem=14pxと定義する */
            }

            .card {
                cursor: pointer;
                font-size: 10px;
            }

            .book_title { 

                /*線の種類（二重線）太さ 色*/
                border-bottom: double 5px #FFC778;

            }

            [v-cloak] {
                display: none;
            }
        </style>
    </head>
    <body>
    
        <div class="container-xs pt-3 mx-5">
            <div id="app">
    
            <div class="sticky-top ">
                <div class="row d-flex justify-content-center bg-primary text-white p-2">
                    <div><h3 class="m-0 mx-2">{{ $bookmark->title }}</h3></div>
                </div>
                <div class="row mt-3">
                    <div class="mx-2">
                        <i class="fas fa-list-ol fa-2x" @click="display_all"></i>
                    </div>
                    <div class="mx-3">
                        <i class="far fa-question-circle fa-2x" data-toggle="modal" data-target="#aboutModal"></i>
                    </div>
                    <div class="mx-2">
                        <input type="text" v-model="search_keyword" @input="search_by_keyword" placeholder="search title">
                    </div>
                 </div>
                    
                <div v-show="ytplay_flg">
                    <div class="row d-flex justify-content-center bg-light">
                        <div id="ytarea"></div>
                        <p @click="closeYT">
                        <i class="far fa-times-circle fa-2x"></i>
                        </p>
                    </div>
                </div>
            </div>
    
            <div class="modal fade" id="aboutModal">
                <div class="modal-dialog">
                    <div class="modal-content">
    
                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h5 class="modal-title">{{ $bookmark->title }}</h5>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <!-- Modal body -->
                        <div class="m-3">
                            <div class="my-3">
                                <h5 class="book_title my-2">About {{ $bookmark->title }} </h5>
                                <div>
                                    {{ $bookmark->comment }}
                                </div>
                            </div>
                            <div class="my-3">
                                <h5 class="book_title my-2">操作方法</h5>
                                <div class="px-3">
                                    小学生からお年寄りまで簡単に操作できることを目指してわかりやすくしています。ポイントのみ説明します。<br><br>
                                </div>
                                <div class="px-3">
                                    <div class="">
                                        <div class="my-2">
                                            <i class="fas fa-list-ol"></i><br>
                                            検索などにより絞り込みがされた状態で押すと全部の番組を表示します。全部表示されている時は何もおこりません。
                                        </div>
                                        <div class="my-2">
                                            <i class="fas fa-sort"></i><br>
                                            表示されている番組をソートします。ソートは一覧に表示のあるPodcastの配信日によります。
                                        </div>
                                        <div class="my-2">
                                            <i class="fab fa-youtube"></i><br>
                                            Youtubeを再生します。読み込めない時がありますが再度押すと大丈夫です（改良検討中）。
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="my-3">
                                <h5 class="book_title my-2">My-MBM より</h5>
                                <div class="px-3">
                                    自分の好きをシェアしよう
                                </div>
                                
                            </div>
    
                        </div>
                       
                        
                    </div>
                </div>
            </div>
    
            <div>
                <div class="d-flex mx-0 mt-3">
                    <div><i class="fas fa-sort fa-2x" @click="sort_change()"></i></div>
                </div>
                <div v-for="data in searched_program" class="border border-left-0 border-right-0 border-top-0 my-1 py-1 mx-1 px-0">
                    <div class="row">
                        <div class="text-left px-0" v-cloak> @{{ data['title'] }} </div>
                    </div>
                    <div class="row">
                        <div class="text-left px-0" v-cloak> @{{ data['comment'] }} </div>
                    </div>
                    <div class="row d-flex justify-content-end align-self-end">
                        <template v-if="data['youtube_url'] != ''">
                        <div class="mx-2">
                            <p @click="playYT(data['youtube_url'])">
                                <i class="fab fa-youtube fa-2x"></i>
                            </p>
                        </div>
                        </template>
                    </div>
                </div>
            </div>
    
                
                </div>
    
            </div>
        </div>
        
    
    
        <script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <script src="https://unpkg.com/axios/dist/axios.min.js"></script>    

<script>

let vm = new Vue({
    el: '#app',
    data: {
        program_data: [],
        ytplay_flg: false,
        cur_video_id: "",
        themes: [],
        searched_program: [],
        sort_flg: 'd',  // ascending or decending
        book_json: [],
        search_keyword: ""
    },
    methods: {
        playYT: function(video_id) {
            this.ytplay_flg = true;
            this.cur_video_id = video_id;
            console.log(video_id);
            //ytPlayer.cueVideoById(video_id.replace('/watch?v=', ''));{videoId: videoId}
            console.log(video_id);
            ytPlayer.cueVideoById({videoId: video_id});           
        },
        closeYT: function() {
            ytPlayer.stopVideo();
            this.ytplay_flg = false;
        },
        episode_num: function(num){
            if (num.indexOf('ex.')) {
                return '#' + Number(num)
            } else {
                return '#ex.' + Number(num.substr(3)) 
            }
        },
        modify_themes: function() {
            let l = this.themes.length;
            dx = 3 - l%3;
            for (i=0; i<dx; i++) {
                this.themes.push([])
            }
        },
        search_theme: function(theme_id) {
            
            let temp = []
            this.searched_program = this.program_data.filter( function( value, index, array ) {
                return value.theme_id === theme_id;       
            }, theme_id)
            
            this.sort_flg = 'a'
            this.sort_program(this.sort_flg)
            $('#myModal').modal('hide');
        },
        search_by_keyword: function() {
            this.searched_program = this.program_data.filter( function( value, index, array ) {
                 return value.title.indexOf(this.search_keyword) >= 0;       
            }, this)
        },
        display_all: function(p_no) {
            this.searched_program = this.program_data
            this.sort_program(this.sort_flg)
        },
        sort_program: function() {
            this.searched_program.sort(function(a,b){
                if( a.delivery_date < b.delivery_date ) {
                    return -1;
                } else if( a.delivery_date > b.delivery_date ) {
                    return 1;
                } else {
                    if (a.num < b.num) {
                        return -1;
                    } else {
                        return 1;
                    }
                }
            });
            if (this.sort_flg === 'd') {
                this.searched_program = this.searched_program.reverse();
            }
        },
        sort_change: function() {
            if (this.sort_flg === 'd') {
                this.sort_flg = 'a';
            } else {
                this.sort_flg = 'd';
            }
            this.sort_program(this.sort_flg);
        },
        theme_books: function(id) {
            console.log(id)
            return this.book_json.filter( function( value, index, array ) {
                return value.id === id;       
            }, id)
        }
    },
    mounted: function() {
        axios
            .get('/mbm/programs/' + {{ $bookmark->id}})
            .then( response => {
                this.program_data = response.data;
                this.searched_program = this.program_data
                this.display_all(this.sort_flg)
            })    
            .catch(function(error) {
                console.log(error);
            });
    },
    created: function () {
        
        
    }
})


// YouTube Player APIを読み込む
let tag = document.createElement('script');
tag.src = "https://www.youtube.com/iframe_api";
let firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

let ytPlayer;
// API読み込み後にプレーヤー埋め込み
// When You Tube API is ready, create a new 
// You Tube player in the div with id 'player'
function onYouTubeIframeAPIReady() {
    ytPlayer = new YT.Player('ytarea', 
      {
          videoId: 'FvCf8xYLYuA',   // Load the initial video
          width: 250,
          height: 190,
          playerVars: {
                 autoplay: 0,      // Don't autoplay the initial video
                 rel: 0,           //  Don’t show related videos
                 theme: "light",   // Use a light player instead of a dark one
                 controls: 1,      // Show player controls
                 showinfo: 0,      // Don’t show title or loader
                 modestbranding: 1 // No You Tube logo on control bar
          }
      });
  
}

</script>




    </body>
</html>