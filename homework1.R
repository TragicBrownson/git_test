standing_offer <- 0.9

# Your code here

# 1. Tuesday first
# the auctioneer should accept a bid if the bid is greater than the standing offer.
dfArtAuction <- data.frame(
  amount_of_bid = c(1, 2, 3, 4),
  prob_of_mon_bid = c(0, 0.5, 0.5, 0),
  prob_of_tue_bid = c(0, 0.8, 0, 0.2)
)

standing_offer <- 0.9

#Tuesday, decision
#accept or reject
# compared to stnding offer
#mutate: create a new column

library(dplyr)
dfTuesday <- dfArtAuction %>%
  mutate(tue_decision = ifelse(amount_of_bid > standing_offer
                               "Accept"
                               "Reject")
         ) %>%
  mutate(tue_val <- ifelse(tue_decision == "Accept",
                           amount_of_bid*prob_of_tue_bid,
                           standing_offer*prob_of_tue_bid)
         )
Tuesday_EMV <- dfTuesday %>% # |>
  summarize(tue_EMV = sum(tue_val)) %>% pull(tue_EMV)
#create a column for Tuesday decision




# 2. Monday
# the auctioneer should compare the Monday bid to the Tuesday EMV.