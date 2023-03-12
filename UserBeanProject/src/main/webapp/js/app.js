$(document).ready( function (){
		$("#addRow").click(function () {
	        var html = '';
	        html += '<div id="inputFormRow">';
	        html += '<div class="input-group mb-3">';
	        html += '<input type="text" name="sub_task_name" class="form-control m-input" placeholder="Enter Subtask" autocomplete="off">';
	        html += '<div class="input-group-append">';
	        html += '<button id="removeRow" type="button" class="btn btn-danger">Remove</button>';
	        html += '</div>';
	        html += '</div>';

	        $('#newRow').append(html);
	    });

	    // remove row
	    $(document).on('click', '#removeRow', function () {
	        $(this).closest('#inputFormRow').remove();
	    });
	    
	    
	    
	});
	
	//$(".alert").alert();
    $(".datepicker" ).datepicker();
    
    function deleteTask(task_id){
		Swal.fire({
			  title: 'Are you sure?',
			  text: "You won't be able to revert this!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes, delete it!'
			}).then((result) => {
			  if (result.isConfirmed) {
				  
				  $.ajax({
	                    type: "GET",
	                    url: "deleteTask",
	                    data: {id:task_id},
	                    dataType: "json", 
	                    timeout: 30000,
	                    success: function(data) 
	                    {
	                        console.log(data);
	                        if(data){
	                            swal({
	                              title:"Deleted!",
	                              text:'Task deleted',
	                              type:'success',
	                              timer:10000
	                            });
	                        }
	                    },
	                    error: function(xhr) {
	                        console.log(xhr.statusText);
	                    }
	                });
				
			  }
			})
	}
	
	function completeTask(taskId){
		Swal.fire({
			  title: 'Are you sure?',
			  text: "You won't be able to revert this!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes, delete it!'
			}).then((result) => {
			  if (result.isConfirmed) {
				  
				  $.ajax({
	                    type: "GET",
	                    url: "completeTask",
	                    data: {id:taskId},
	                    dataType: "json", 
	                    timeout: 30000,
	                    success: function(data) 
	                    {
	                        console.log(data);
	                        if(data){
	                            swal({
	                              title:"Completed!",
	                              text:'Task completed',
	                              type:'success',
	                              timer:10000
	                            }); 
	                        }
	                    },
	                    error: function(xhr) {
	                        console.log(xhr.statusText);
	                    }
	                });
				
			  }
			})
	}
	