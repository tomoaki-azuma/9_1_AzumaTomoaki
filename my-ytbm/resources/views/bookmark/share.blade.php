@extends('layouts.app')

@section('content')
    <div class="container">
        <div id="app">
            <h4>Share Your MBM</h4>
            <div class="mb-5">
                <div class="card mb-5">
                    
                    <div class="card-header">
                        <div class="d-flex row">
                            <div class="mr-auto"><i class="fas fa-search mx-2"></i><input type="text"></div>
                        </div>
                        
                    </div>
                    <div class="card-block p-0">
                        <table class="table table-bordered table-sm m-0">
                            <thead class="bg-warning">
                                <tr>
                                    <th class="text-center">Title</th>
                                    <th class="text-center">Share URL</th>
                                    <th class="text-center">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <template v-for="bookmark in bookmarks">
                                    <tr>
                                        <td>@{{ bookmark.title }}</td>
                                        @php
                                            $shared_url = config('app.url').':8000/mbm/'
                                        @endphp
                                        <td><a v-bind:href="'{{ $shared_url }}' + bookmark.share_token" target="_blank">{{ $shared_url }}@{{ bookmark.share_token }}</a></td>
                                        <td class="">
                                            <i class="fab fa-facebook"></i>
                                            <i class="fab fa-twitter"></i>
                                        </td>
                                    </tr>
                                </template>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
@endsection

@section('vuepart')
<script>
    let vm = new Vue({
        el: '#app',
        data: {
            bookmarks: []
        },
        methods: {
            date_format: function(date) {
                d = new Date(date);
                console.log(d);
                return d.getFullYear() + '/' + (d.getMonth()+1) + '/' + d.getDate();
            }
        },
        created: function() {
            axios
                .get('/bookmark/user/{{ $user_id }}')
                .then( response => {
                    this.bookmarks = response.data;
                })    
                .catch(function(error) {
                    console.log(error);
                });
        }
    })
</script>
@endsection
