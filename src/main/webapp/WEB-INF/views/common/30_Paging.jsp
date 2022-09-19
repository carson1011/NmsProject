<ul class="dataTables_paginate paging_simple_numbers" id="paging">
    <!-- pagination{s} -->
    <div id="paginationBox">
        <ul class="pagination">
            <c:if test="${pagination.prev}">
                <li class="page-item">
                    <a class="page-link" href="#"
                       onClick="fn_prev('${pagination.page}', '${pagination.range}',
                                                        '${pagination.rangeSize}')">Previous</a>
                </li>
            </c:if>
            <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}"
                       var="idx">
                <li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
                    <a class="page-link" href="#"
                       onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a>
                </li>
            </c:forEach>
            <c:if test="${pagination.next}">
                <li class="page-item">
                    <a class="page-link" href="#"
                       onClick="fn_next('${pagination.range}', '${pagination.range}',
                                                           '${pagination.rangeSize}')">Next</a>
                </li>
            </c:if>
        </ul>
    </div>
</ul>