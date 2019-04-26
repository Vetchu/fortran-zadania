MODULE bettermath
        IMPLICIT NONE
        private

        public::bettmull
        private::bettmull4,bettmull8,bettmull16
        interface bettmull
                procedure bettmull4,bettmull8,bettmull16
        end interface
contains
        function bettmull4 (A, B) result (C)
                implicit none
                real ( kind=4), intent (in),dimension (:,:) :: A, B
                real ( kind=4), dimension(SIZE(A,1),SIZE(B,2)) :: C
                integer::i,j,k
                do j=1,(SIZE(B,2))
                do k=1,(SIZE(A,2))
                do i=1,(SIZE(A,1))
                C(i,j)=C(i,j)+A(i,k)*B(k,j)
                end do
                end do
                end do
        end function
        function bettmull8 (A, B) result (C)
                implicit none
                real ( kind=8), intent (in),dimension (:,:) :: A, B
                real ( kind=8), dimension(SIZE(A,1),SIZE(B,2)) :: C
                integer::i,j,k
                do k=1,(SIZE(B,2))
                do j=1,(SIZE(A,2))
                do i=1,(SIZE(A,1))
                C(i,j)=C(i,j)+A(i,k)*B(k,j)
                end do
                end do
                end do
        end function
        function bettmull16 (A, B) result (C)
                implicit none
                real ( kind=16), intent (in),dimension (:,:) :: A, B
                real ( kind=16), dimension(SIZE(A,1),SIZE(B,2)) :: C
                integer::i,j,k
                do k=1,(SIZE(B,2))
                do j=1,(SIZE(A,2))
                do i=1,(SIZE(A,1))
                C(i,j)=C(i,j)+A(i,k)*B(k,j)
                end do
                end do
                end do
        end function
END MODULE bettermath
