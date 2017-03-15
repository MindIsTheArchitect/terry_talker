TERRY_WORDS=$(wget http://www.templeos.org/Wb/Home/Web/TAD/DailyBlog.html -q -O -)
TERRY_WORDS=$(echo "$TERRY_WORDS" | sed -re '/God says/d' | sed -re '/Moses says/d' | sed -re '/^[0-9]+/d' | sed -re '/<[^>]*>/d' | sed -re '/Response of/d' | sed -re '/C:/d' | sed "/'/d" | sed -re '/^[0-9*A-Z]{,64}$/d' | sed -re '/.c/d' | sed -re '/Blog/d' | sed "/\*\*/d" | sed -re '/---*/d' | sed -re '/===*/d' | sed -re '/margin-*/d')
echo "$TERRY_WORDS"
