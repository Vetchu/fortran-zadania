MODULE dotmath
        IMPLICIT NONE
        private

        public::dotmull
        private::dotmull4,dotmull8,dotmull16
        interface dotmull
                procedure dotmull4,dotmull8,dotmull16
        end interface
contains
        function dotmull4 (A, B) result (C)
                implicit none
                real ( kind=4), intent (in),dimension (:,:) :: A, B
                real ( kind=4), dimension(SIZE(A,1),SIZE(B,2)) :: C
                integer::i,j
                do j=1,(SIZE(B,2))
                do i=1,(SIZE(A,1))
                C(i,j)=DOT_PRODUCT(A(i,:),B(:,j))
                end do
                end do
        end function
        function dotmull8 (A, B) result (C)
                implicit none
                real ( kind=8), intent (in),dimension (:,:) :: A, B
                real ( kind=8), dimension(SIZE(A,1),SIZE(B,2)) :: C
                integer::i,j
                 do j=1,(SIZE(B,2))
                do i=1,(SIZE(A,1))
                C(i,j)=DOT_PRODUCT(A(i,:),B(:,j))
                end do
                end do

       end function
        function dotmull16 (A, B) result (C)
                implicit none
                real ( kind=16), intent (in),dimension (:,:) :: A, B
                real ( kind=16), dimension(SIZE(A,1),SIZE(B,2)) :: C
                integer::i,j
                do j=1,(SIZE(B,2))
                do i=1,(SIZE(A,1))
                C(j,i)=+DOT_PRODUCT(A(i,:),B(:,j))
                end do
                end do
        end function
END MODULE dotmath
