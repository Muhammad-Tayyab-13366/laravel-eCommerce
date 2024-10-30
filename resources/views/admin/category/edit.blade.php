@extends('admin.layouts.app')

@section('content')

<!-- Content Header (Page header) -->
<section class="content-header">					
    <div class="container-fluid my-2">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>Edit Category</h1>
            </div>
            <div class="col-sm-6 text-right">
                <a href="{{ route('categories.index') }}" class="btn btn-primary">Back</a>
            </div>
        </div>
    </div>
    <!-- /.container-fluid -->
</section>
<!-- Main content -->
<section class="content">
    <!-- Default box -->
    <div class="container-fluid">
        <form id="form_create_category" action="{{ route('categories.update', $category->id ) }}" method="post" enctype="multipart/form-data">
            @method('PUT')
            <div class="card">
                <div class="card-body">								
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="name">Name</label>
                                <input type="text" name="name" id="name" value="{{ $category->name }}" class="form-control" placeholder="Name">
                                <p></p>	
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="slug">Slug</label>
                                <input type="text" readonly name="slug" id="slug" value="{{ $category->slug }}" class="form-control" placeholder="Slug">
                                <p></p>	
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="email">Status</label>
                                <select name="status" id="status"  class="form-control">
                                    <option value="1" @if( $category->status == 1) selected @endif>Active</option>
                                    <option value="0"  @if( $category->status == 0) selected @endif>In-Active</option>
                                </select>	
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="email">Image</label>
                                <input type="file" name="image" id="image"  class="form-control"  onchange="previewImage(event)">
                                <p></p>
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <div class="mb-3">
                                <img src="{{ asset('storage/'. $category->image ) }}" name="image_preview" id="image_preview"   width="30%"  class=" @if( $category->image == '')  d-none @endif">
                                <p></p>
                            </div>
                        </div>
                    </div>
                </div>							
            </div>
            <div class="pb-5 pt-3">
                <button class="btn btn-primary" type="submit">Update</button>
                <a href="{{ route('categories.index') }}" class="btn btn-outline-dark ml-3">Cancel</a>
            </div>
        </form>
       
    </div>
    <!-- /.card -->
</section>
@endsection

@section('customejs')
   <script>
        $("#form_create_category").submit(function(event){
            event.preventDefault();
            element = new FormData(this);
            console.log(element);
            $("button[type='submit']").attr('disabled', true);
            $.ajax({
                url : ' {{ route("categories.update", $category->id) }}',
                headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                type: 'post',
                data: element,
                dataType: 'json',
                processData: false, // Important for FormData
                contentType: false, // Important for FormData
                success: function(response){

                    if(response['status'] == false){

                        $("button[type='submit']").attr('disabled', false);
                        var errors = response['errors'];
                        console.log(errors['name']);
                        if(errors['name']){
                            $("#name").addClass('is-invalid').siblings('p').addClass('invalid-feedback').html(errors['name'][0]);
                        }else{
                            $("#name").removeClass('is-invalid').siblings('p').removeClass('invalid-feedback').html('');
                        }

                        if(errors['slug']){
                            $("#slug").addClass('is-invalid').siblings('p').addClass('invalid-feedback').html(errors['slug'][0]);
                        }else{
                            $("#slug").removeClass('is-invalid').siblings('p').removeClass('invalid-feedback').html('');
                        }

                        if(errors['image']){
                            $("#image").addClass('is-invalid').siblings('p').addClass('invalid-feedback').html(errors['image'][0]);
                        }else{
                            $("#image").removeClass('is-invalid').siblings('p').removeClass('invalid-feedback').html('');
                        }

                    }else{
                        window.location.href = "{{ route('categories.index') }}";
                    }

                },
                error: function(jqXHR, exception){

                }
            });
        });

        $("#name").on('input', function(){
            name = $(this).val();
            $.ajax({
                url : ' {{ route("getSlug") }}',
                headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                type: 'get',
                data: { "title" : name },
                dataType: 'json',
                success: function(response){

                    if(response['slug']){
                       $("#slug").val(response['slug']);
                    }
                },
                error: function(jqXHR, exception){

                }
            });
        });

        function previewImage(event) {
            const imagePreview = document.getElementById('image_preview');
            const file = event.target.files[0];

            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    imagePreview.src = e.target.result;
                    imagePreview.classList.remove('d-none') // Show the preview
                };
                reader.readAsDataURL(file);
            } else {
                imagePreview.src = '#';
                imagePreview.classList.add('d-none') 
            }
        }

   </script>
@endsection