@extends('front.layouts.app')

@section('content')
<section class="section-5 pt-3 pb-3 mb-3 bg-white">
        <div class="container">
            <div class="light-font">
                <ol class="breadcrumb primary-color mb-0">
                    <li class="breadcrumb-item"><a class="white-text" href="#">Home</a></li>
                    <li class="breadcrumb-item">Login</li>
                </ol>
            </div>
        </div>
    </section>

    <section class=" section-10">
        <div class="container">
            <div class="login-form">
                @if (Session::has('success'))
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <strong>Success!</strong> {{ Session::get('success') }}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div> 
                @endif 
                @if (Session::has('error'))
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>Error!</strong> {{ Session::get('error') }}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div> 
                @endif 
                <form action="{{ route('account.processLogin') }}" method="post" name="login_form" id="login_form">
                    @csrf
                    <h4 class="modal-title">Login to Your Account</h4>
                    <div class="form-group">
                        <input type="text" name="email" class="form-control @error('email') is-invalid @enderror" placeholder="Email" value="{{ old('email') }}" required="required">
                        @error('email')
                            <p class="invalid-feedback"> {{ $message }}</p>
                        @enderror
                    </div>
                    <div class="form-group">
                        <input type="password" name="password"  class="form-control  @error('password') is-invalid @enderror" placeholder="Password" required="required">
                        @error('password')
                            <p class="invalid-feedback"> {{ $message }}</p>
                        @enderror
                    </div>
                    <div class="form-group small">
                        <a href="#" class="forgot-link">Forgot Password?</a>
                    </div> 
                    <input type="submit" class="btn btn-dark btn-block btn-lg" value="Login">              
                </form>			
                <div class="text-center small">Don't have an account? <a href="{{ route('account.register') }}">Sign up</a></div>
            </div>
        </div>
    </section>
@endsection

@section('customejs')

<script>
    // $("#login_form").submit(function(event){
    //     event.preventDefault();
    //     $.ajax({
    //         url: '{{ route("account.processLogin") }}',
    //         type: 'post',
    //         data: $(this).serializeArray(),
    //         dataType: 'json',
    //         headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
    //         success: function(response){
                
    //             if(response.status == false){
    //                 errors = response.errors;
    //                 // if(errors.name){
    //                 //     $('#name').addClass('is-invalid').siblings('p').addClass('invalid-feedback').html(errors.name);
    //                 // }else {
    //                 //     $('#name').removeClass('is-invalid').siblings('p').removeClass('invalid-feedback').html('');
    //                 // } 

    //                 // if(errors.email){
    //                 //     $('#email').addClass('is-invalid').siblings('p').addClass('invalid-feedback').html(errors.email);
    //                 // }else {
    //                 //     $('#email').removeClass('is-invalid').siblings('p').removeClass('invalid-feedback').html('');
    //                 // } 

    //                 // if(errors.password){
    //                 //     $('#password').addClass('is-invalid').siblings('p').addClass('invalid-feedback').html(errors.password);
    //                 // }else {
    //                 //     $('#password').removeClass('is-invalid').siblings('p').removeClass('invalid-feedback').html('');
    //                 // } 
    //             }else {
    //                 // window.location.href = "{{ route('account.login') }}";
    //             }
                
    //         },
    //         error: function(){

    //         }
    //     });
    // });

</script>
@endsection